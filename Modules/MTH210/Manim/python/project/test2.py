#manim -pql test2.py Cauchy --disable_caching

#use the TTL5.6
from manim import *
class Cauchy(ThreeDScene):
    #initial global values
    #s_left = 1
    #s_right = 2
    t_left = 0
    t_right = 4
    #domain = (s_left,s_right,t_left,t_right)
#======================================================绘制坐标系以及箭头
    def show_axis(self):
        axes = ThreeDAxes()
        self.set_camera_orientation(phi=90 * DEGREES, theta=-90 * DEGREES)
        self.add(axes)
#======================================================绘制曲线函数
#=====================s \in [-\inf,-2]
    def ini_curve__inf__2(x):
        return 0
    def curve_function__inf_2(s,t,f = ini_curve__inf__2):
        t = t
        x = s+f(s)*t
        y = t
        z = 0
        return np.array([x, y, z])
    domain__inf__2 = (-4,-2,t_left,t_right)
#=====================s \in [-2,-1]
    def ini_curve__2__1(x):
        return (x+2)*(x+2)
    def curve_function__2__1(s,t,f = ini_curve__2__1):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        y = t
        z = ((2*x*t+4*t+1)-np.sqrt(4*x*t+8*t+1))/(2*t*t)
        return np.array([x, y, z])
    domain__2__1 = (-2,-1,t_left,t_right)
#=====================s \in [-1,0]
    def ini_curve__1_0(x):
        return 2-x*x
    def curve_function__1_0(s,t,f = ini_curve__1_0):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        y = t
        z = ((2*x*t-1)+np.sqrt(8*t*t-4*x*t+1))/(2*t*t)
        return np.array([x, y, z])
    domain__1_0 = (-1,0,t_left,t_right)
#=====================s \in [0，1]
    def ini_curve_0_1(x):
        return 2-x*x
    def curve_function_0_1(s,t,f = ini_curve_0_1):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        y = t
        z = ((2*x*t-1)+np.sqrt(8*t*t-4*x*t+1))/(2*t*t)
        return np.array([x, y, z])
    domain_0_1 = (0,1,t_left,t_right)
#=====================s \in [1,2]
    def ini_curve_1_2(x):
        return (x-2)*(x-2)
    def curve_function_1_2(s,t,f = ini_curve_1_2):
        t = t+0.001#防止出现0/0
        x = s+f(s)*t
        y = t
        z = ((2*x*t-4*t+1)-np.sqrt(4*x*t-8*t+1))/(2*t*t)
        return np.array([x, y, z])
    domain_1_2 = (1,2,t_left,t_right)
#=====================s \in [2,\inf]
    def ini_curve_2_inf(x):
        return 0
    def curve_function_2_inf(s,t,f = ini_curve_2_inf):
        t = t
        x = s+f(s)*t
        y = t
        z = 0
        return np.array([x, y, z])
    domain_2_inf = (2,4,t_left,t_right)
#======================曲线打包
    curves = (curve_function__inf_2,curve_function__2__1,curve_function__1_0,curve_function_0_1,curve_function_1_2,curve_function_2_inf)
    domains = (domain__inf__2,domain__2__1,domain__1_0,domain_0_1,domain_1_2,domain_2_inf)
#======================================================创建动画
    def construct(self,curves = curves,domains = domains):
        self.show_axis()
        self.add_curve(curve_function = curves[0],domain = domains[0])
        self.add_curve(curve_function = curves[1],domain = domains[1])
        self.add_curve(curve_function = curves[2],domain = domains[2])
        self.add_curve(curve_function = curves[3],domain = domains[3])
        self.add_curve(curve_function = curves[4],domain = domains[4])
        self.add_curve(curve_function = curves[5],domain = domains[5])
#======================================================添加曲线    
    def add_curve(self,curve_function,domain,resolution_fa = 18 ,checkerboard_colors = ['#29ABCA', '#236B8E']):
        curve = Surface(
            curve_function,
            resolution=(resolution_fa, resolution_fa),
            #u_range=[(3*domain[0]-domain[1])/2.0, (3*domain[1]-domain[0])/2.0],
            u_range=[domain[0],domain[1]],
            v_range=[0, 0],
            stroke_color = GREEN,
            stroke_width = 2,
        )
        self.add(curve)
        # dots&paths
        '''
        # add points animations
        '''
        '''
        def addpoints(self,ini_s,t_range):#direction = 1 t>0; -1 t<0
            t = ValueTracker(0)
            #path = VMobject()
            dot = Dot(
                    point = curve_function(ini_s,t.get_value()),
                    color = BLUE,
                )
            #path.set_points_as_corners([dot.get_center(), dot.get_center()])
            dot.add_updater(lambda x: x.move_to(curve_function(ini_s,t.get_value())))
        
        
            def update_path(path):
                previous_path = path.copy()
                previous_path.add_points_as_corners([dot.get_center()])
                path.become(previous_path)
            #path.add_updater(update_path)
        
            trace = TracedPath(dot.get_center,dissipating_time=2)#测试一下
            self.add(dot)
            #self.add(trace)
            return t.animate.increment_value(t_range)
        '''
        def addpoints(self,ini_s,t_stop,curve_function = curve_function):#direction = 1 t>0; -1 t<0
            dot = Dot(
                point = curve_function(ini_s,0),
                color = BLUE,
            )
            self.add(dot)
            path = ParametricFunction(
                lambda t: curve_function(ini_s,t),
                t_range=[0,t_stop],
            )
            trace = TracedPath(dot.get_center,dissipating_time=1)
            self.add(trace)
            return MoveAlongPath(dot, path, rate_functic = linear)
        '''
        # add points # AnimationGroup
        '''
        #curve_animations = [[addpoints(self,ini_s,domain[3]),addpoints(self,ini_s,domain[2])] for ini_s in np.arange(domain[0],domain[1]+0.001,0.1)]
        #curve_animations = [[addpoints(self,ini_s,domain[3])] for ini_s in np.arange(domain[0],domain[1]+0.001,0.2)]
        #curve_animations = list(np.array(curve_animations).flatten())
        #self.play(AnimationGroup(*curve_animations,lag_ratio=0.1))
        '''
        # add plane
        '''
        plane = Surface(
            curve_function,
            resolution=(resolution_fa, resolution_fa),
            u_range=[domain[0], domain[1]],
            v_range=[domain[2], domain[3]],
            #stroke_color = GREEN,
            #stroke_width = 2,
            fill_opacity = 0.5,
            #checkerboard_colors = checkerboard_colors,
        )
        #self.play(Create(plane))
        #self.wait(5)
        self.add(plane)