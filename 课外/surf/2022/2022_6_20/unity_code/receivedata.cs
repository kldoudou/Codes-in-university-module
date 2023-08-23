using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;

using System.Text;

public class receivedata : MonoBehaviour
{


    // Use this for receive initialization receive
    TcpListener listener;
    String msg;
    IPAddress receive_ip = IPAddress.Parse("127.0.0.1");
    string s;

    //int count = 0;

    float custom_forward;
    float custom_backward;
    //float custom_leftward;
    //float custom_rightward;
    //float custom_upward;
    //float custom_downward;
    float custom_rotateLeft;
    float custom_rotateRight;
    
    float[] cus;
    float[] cus1 = new float[8];
    bool test = false;
    bool test1 = false;
    bool test2 = false;
    bool test3 = false;
    float stardeg_diff;
    float stardeg;//record the location should to be
    float count_x;//record the x now
    float count_z;//record the y now
    float count_y;
    // Start is called before the first frame update
    void Start()
    {
        stardeg = this.transform.eulerAngles.y;//record the location should be
        count_x = this.transform.localPosition.x;
        count_z = this.transform.localPosition.z;
        count_y = this.transform.localPosition.y;
        Debug.Log("receiver is set up");
        receive_mesage_start();
    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log("test1: " + test1);
        //Debug.Log(this.transform.localPosition);
        //Debug.Log("test: "+test);
        cus = receivemessageloop();
        if(cus != null && test==false)
        {
            
            cus.CopyTo(cus1,0);
            test = true;
            stardeg_diff = cus1[7] - cus1[6];
            stardeg += stardeg_diff;
            //count_x = (float)Math.Sin(Math.PI * stardeg / 180) * (cus1[0] - cus1[1]);
            //count_z = (float)Math.Cos(Math.PI * stardeg / 180) * (cus1[0] - cus1[1]);
            count_y += cus1[4] - cus1[5];
            test1 = true;
        }
        if (test1)
        {
            if (stardeg_diff > 13)//incase 12.5*force < stardeg_diff
            {
                test1 = applycustom_L_R(stardeg, 1F);//rotate
            }
            else if(stardeg_diff > 2)
            {
                test1 = applycustom_L_R(stardeg, 0.1F);
            }
            else
            {
                test1 = applycustom_L_R(stardeg, 0.01F);
            }
            test2 = !test1;
            test3 = !test1;
        }
        
        if (test2)
        {
            Debug.Log("yep");
            test2 = applycustom_F_B(cus1[0] - cus1[1], count_x, count_z,0.5F);
            
        }
        
        if (test3)
        {
            test3 = applycustom_U_D(cus1[4] - cus1[5], count_y);
        }
        
        test = false;
        //Debug.Log(this.transform.eulerAngles);
    }

    void receive_mesage_start()//put it into start
    {
        listener = new TcpListener(receive_ip, 55001);
        listener.Start();
        print("is listening");
    }


    float[] receivemessageloop()//put it into update
    {
        // Update is called once per frame
        if (!listener.Pending())
        {
            return null;
        }
        else
        {
            print("socket comes");
            TcpClient client = listener.AcceptTcpClient();
            NetworkStream ns = client.GetStream();
            StreamReader reader = new StreamReader(ns);
            msg = reader.ReadToEnd();
            print(msg);
            s = string.Empty;
            string[] arr = msg.Split(',');
            float[] cus;
            cus = Array.ConvertAll(arr, float.Parse);
            return cus;
            //gameObject.GetComponent<DroneMovement>().customFeed_forward = custom_forward;
        }
    }
    
    bool applycustom_L_R(float stardeg_need,float force_L_R)//stardeg just where need to go
    {
        //Debug.Log(stardeg);
        float diff_angle = stardeg_need - this.transform.eulerAngles.y;
        //Debug.Log(diff_angle);
        if (diff_angle > 12.5*force_L_R)
        {
            gameObject.GetComponent<DroneMovement>().customFeed_rotateLeft = 0F;
            gameObject.GetComponent<DroneMovement>().customFeed_rotateRight = force_L_R;
            return true;
        }
        else if (diff_angle < - 12.5 * force_L_R)
        {
            gameObject.GetComponent<DroneMovement>().customFeed_rotateRight = 0F;
            gameObject.GetComponent<DroneMovement>().customFeed_rotateLeft = force_L_R;
            return true;
        }
        else {
            gameObject.GetComponent<DroneMovement>().customFeed_rotateRight = 0F;
            gameObject.GetComponent<DroneMovement>().customFeed_rotateLeft = 0F;
            return false;
        }
    }

    
    bool applycustom_F_B(float horizontal_change,float position_x,float position_z,float force_F_B)
    {
        if(horizontal_change > 0)
        {
            if ( (transform.localPosition.x-position_x) * (transform.localPosition.x-position_x)+(transform.localPosition.z-position_z)*(transform.localPosition.z-position_z)< horizontal_change * horizontal_change)
            {
                gameObject.GetComponent<DroneMovement>().customFeed_forward = force_F_B;
                return true;
            }
            else
            {
                gameObject.GetComponent<DroneMovement>().customFeed_forward = 0F;
            }
        }
        else if(horizontal_change < 0)
        {
            if ((transform.localPosition.x-position_x)*(transform.localPosition.x-position_x)+(transform.localPosition.z-position_z)*(transform.localPosition.z-position_z)<(horizontal_change-13*force_F_B)*(horizontal_change-13*force_F_B))
            {
                gameObject.GetComponent<DroneMovement>().customFeed_backward = force_F_B;
                return true;
            }
            else
            {
                gameObject.GetComponent<DroneMovement>().customFeed_backward = 0F;
            }
        }
        return false;
    }

    bool applycustom_U_D(float vertical_change, float position_y)
    {
        if(vertical_change > 0)
        {
            if(transform.localPosition.y - position_y < vertical_change)
            {
                gameObject.GetComponent<DroneMovement>().customFeed_upward = 0.5F;
                return true;
            }
            else
            {
                gameObject.GetComponent<DroneMovement>().customFeed_upward = 0F;
            }
        }
        else if(vertical_change < 0)
        {
            if ( position_y - transform.localPosition.y < - vertical_change)
            {
                gameObject.GetComponent<DroneMovement>().customFeed_downward = 0.5F;
                return true;
            }
            else
            {
                gameObject.GetComponent<DroneMovement>().customFeed_downward = 0F;
            }
        }
        return false;
    }
}
