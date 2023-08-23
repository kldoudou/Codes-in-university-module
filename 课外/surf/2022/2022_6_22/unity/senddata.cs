using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;

using System.Text;

public class senddata : MonoBehaviour
{
    internal Boolean socketReady = false;
    TcpClient mySocket;
    NetworkStream theStream;
    StreamWriter theWriter;
    StreamReader theReader;
    String Host = "localhost";
    Int32 Port = 55000;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("sender is set up");
        sendmessage();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void sendmessage()
    {
        try
        {
            mySocket = new TcpClient(Host, Port);
            theStream = mySocket.GetStream();
            theWriter = new StreamWriter(theStream);
            socketReady = true;
            //writeSocket("yah!! it works");
            Byte[] sendBytes = Encoding.UTF8.GetBytes("yah!! it works");
            mySocket.GetStream().Write(sendBytes, 0, sendBytes.Length);
            Debug.Log("socket is sent");
        }
        catch (Exception e)
        {
            Debug.Log("Socket error: " + e);
        }
    }
}
