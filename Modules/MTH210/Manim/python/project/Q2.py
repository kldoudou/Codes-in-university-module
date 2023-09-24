#manim -pql Q2.py Cauchy
#use the TTL5.6

from manim import *
class Cauchy(Scene):
    def defs_divided(s,t):
        delta_t = 0.0001
        t = t+delta_t#防止出现0/0
    #=====================s \in [-\inf,-2]
        def curve_def__inf__2(s,t):
            def f(x):
                out = 0
                return out
            x = s+f(s)*t
            z = 0
            output = np.array([x,z,0])
            return output
    #=====================s \in [-2,-1]
        def curve_def__2__1(s,t):
            def f(x):
                out =  (x+2)*(x+2)
                return out
            x = s+f(s)*t
            z = ((2*x*t+4*t+1)-np.sqrt(4*x*t+8*t+1))/(2*t*t)
            output = np.array([x,z,0])
            return output
    #=====================s \in [-1,1]
        def curve_def__1_1(s,t):
            def f(x):
                out = 2-x*x
                return out
            x = s+f(s)*t
            z = ((2*x*t-1)+np.sqrt(8*t*t-4*x*t+1))/(2*t*t)
            output = np.array([x,z,0])
            return output
    #=====================s \in [1,2]
        def curve_def_1_2(s,t):
            def f(x):
               out = (x-2)*(x-2)
               return out
            x = s+f(s)*t
            z = ((2*x*t-4*t+1)-np.sqrt(4*x*t-8*t+1))/(2*t*t)
            output = np.array([x,z,0])
            return output
    #=====================s \in [2,\inf]
        def curve_def_2_inf(s,t):
            def f(x):
                out = 0
                return out
            x = s+f(s)*t
            z = 0
            output = np.array([x,z,0])
            return output
    #======sometricks====================
    #=====================s \in [-1,1]
        def curve_def__1_1_blow(s,t):
            def f(x):
                out = 2-x*x
                return out
            x = s+f(s)*t
            z = ((2*x*t-1)-np.sqrt(8*t*t-4*x*t+1))/(2*t*t)
            return np.array([x,z,0])
    #=====================s \in [1,2]
        def curve_def_1_2_blow(s,t):
            def f(x):
                out = (x-2)*(x-2)
                return out
            x = s+f(s)*t
            z = ((2*x*t-4*t+1)+np.sqrt(4*x*t-8*t+1))/(2*t*t)
            return np.array([x,z,0])
    #=====================
        
        if (t-delta_t<0.5):
            if (s<=-2):
                output = curve_def__inf__2(s,t)
            elif (s>-2)&(s<=-1):
                output = curve_def__2__1(s,t)
            elif (s>-1)&(s<=1):
                output = curve_def__1_1(s,t)
            elif (s>1)&(s<=4):
                output = np.array([1+t-delta_t,1,0])
            elif (s>4)&(s<=5):    
                output = curve_def_1_2(s-3,t)
            elif (s>5):
                output = curve_def_2_inf(s-3,t)
            return output   
        else:
            if (s<=-2):
                output = curve_def__inf__2(s,t)
            elif (s>-2)&(s<=-1):
                output = curve_def__2__1(s,t)
            elif (s>-1)&(s<=1):
                output = curve_def__1_1(s,t)
            elif (s>1)&(s<=3):
                temp = curve_def__1_1_blow(s-2,t)
                if temp[1]<1:
                    output = np.array([1+t-delta_t,1,0])
                else:
                    output = temp
            elif (s>3)&(s<=4):
                temp = curve_def_1_2_blow(s-2,t)
                if temp[1]>1:
                    output = np.array([1+t-delta_t,1,0])
                else:
                    output = temp
            elif (s>4)&(s<=5):
                output = curve_def_1_2(s-3,t)
            elif (s>5):
                output = curve_def_2_inf(s-3,t)
        return output
#======================================================================
    def add_curve(self,curve_function,ax):
        '''
        # add ini_curve
        '''
        def valuechange(self,t_range):#direction = 1 t>0; -1 t<0
            t = ValueTracker(0)
                #lambda s: curve_function(s,t.get_value()),
            function = ax.plot_parametric_curve(
                        lambda s: curve_function(s,0),
                        t_range = [-3,6],
                        discontinuities=[-2, -1, 1, 2, 3, 4, 5],
                        color = GREEN,
                    )
            function.add_updater(
                lambda func: func.become(
                    ax.plot_parametric_curve(
                        lambda s: curve_function(s,t.get_value()),
                        t_range = [-3,6],
                        discontinuities=[-2, -1, 1, 2, 3, 4, 5],
                        color = GREEN,
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
                valuechange(self,2),
                speedinfo={0.3:0.3},
                )
            )
#======================================================================
    def show_axis(self):
        ax = Axes(
            x_range=[-6, 6], y_range=[0,4]
        ).add_coordinates()
        self.add(ax)
        return ax
#======================================================================
    def construct(self, functions_divided = defs_divided):
        ax = self.show_axis()
        self.add_curve(curve_function = functions_divided,ax = ax)
        #self.wait(2)