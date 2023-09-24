#manim -pql test3.py Cauchy --disable_caching

#use the TTL5.6
from manim import *
class Cauchy(Scene):
    t_left = 0
    t_right = 5
#======================================================绘制坐标系以及箭头
    def show_axis(self):
        ax = Axes(
            x_range=[-6, 6], y_range=[0,4]
        ).add_coordinates()
        self.add(ax)
        return ax
#======================================================绘制曲线函数
#=====================s \in [-\inf,-2]
    def ini_curve__inf__2(x):
        return 0
    def curve_function__inf__2(s,t,f = ini_curve__inf__2):
        t = t
        x = s+f(s)*t
        z = 0
        return np.array([x,z,0])
#=====================s \in [-2,-1]
    def ini_curve__2__1(x):
        return (x+2)*(x+2)
    def curve_function__2__1(s,t,f = ini_curve__2__1):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        z = ((2*x*t+4*t+1)-np.sqrt(4*x*t+8*t+1))/(2*t*t)
        return np.array((x,z,0))
#=====================s \in [-1,1]
    def ini_curve__1_1(x):
        return 2-x*x
    def curve_function__1_1(s,t,f = ini_curve__1_1):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        z = ((2*x*t-1)+np.sqrt(8*t*t-4*x*t+1))/(2*t*t)
        return np.array((x,z,0))
#=====================s \in [1,2]
    def ini_curve_1_2(x):
        return (x-2)*(x-2)
    def curve_function_1_2(s,t,f = ini_curve_1_2):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        z = ((2*x*t-4*t+1)-np.sqrt(4*x*t-8*t+1))/(2*t*t)
        return np.array((x,z,0))
#=====================s \in [2,\inf]
    def ini_curve_2_inf(x):
        return 0
    def curve_function_2_inf(s,t,f = ini_curve_2_inf):
        t = t
        x = s+f(s)*t
        z = 0
        return np.array((x,z,0))
#======================曲线打包
    functions = (curve_function__inf__2, curve_function__2__1, curve_function__1_1, curve_function_1_2, curve_function_2_inf)
    def functions_divided(s,t,functions = functions):
        if (s<-2):
            function = functions[0]
        elif (s>=-2)&(s<-1):
            function = functions[1]
        elif (s>=-1)&(s<1):
            function = functions[2]
        elif (s>=1)&(s<2):
            function = functions[3]
        elif (s>=2):
            function = functions[4]
        else:
            function = functions[0]
        return function(s,t)
#======================================================创建动画
    def construct(self, functions_divided = functions_divided):
        ax = self.show_axis()
        self.add_curve(curve_function = functions_divided,ax = ax)
        self.wait(3)
#======================================================添加曲线    
    def add_curve(self,curve_function,ax):
        '''
        # add ini_curve
        '''
        def valuechange(self,t_range):#direction = 1 t>0; -1 t<0
            t = ValueTracker(0)
                #lambda s: curve_function(s,t.get_value()),
            function = ax.plot_parametric_curve(
                        lambda s: curve_function(s,0),
                        t_range = [-3,3],
                        discontinuities=[-2, -1, 1, 2],
                        color = GREEN,
                    )
            function.add_updater(
                lambda func: func.become(
                    ax.plot_parametric_curve(
                        lambda s: curve_function(s,t.get_value()),
                        t_range = [-3,3],
                        discontinuities=[-2, -1, 1, 2],
                        color = GREEN,
                        dt=1e-08,
                    )
                )
            )
            self.add(function)
            return t.animate.increment_value(t_range)
        '''
        # animation
        '''
        
        self.play(
            ChangeSpeed(
                valuechange(self,3),
                speedinfo={0.2:0.2},
                )
            )
        