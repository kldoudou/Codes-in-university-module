#manim -pql test.py Cauchy

#use the Example2.6
from manim import *
class Cauchy(ThreeDScene):
    #initial global values
    global s_left,s_right,t_left,t_right
    global resolution_fa
    s_left = -1.5
    s_right = 1.5
    t_left = -1
    t_right = 1
    resolution_fa = 48

    def construct(self):
        self.show_axis()
        self.add_curve()
        self.wait()
    def show_axis(self):
        axes = ThreeDAxes()
        self.set_camera_orientation(phi=45 * DEGREES, theta=-45 * DEGREES)
        self.add(axes)
    def add_curve(self):
        def f(x):
            return x*x
        def curve_function(s, t):
            x = s*np.exp(t)
            y = s*np.exp(-t)
            z = f(s)
            return np.array([x, y, z])
        
        curve = Surface(
            curve_function,
            resolution=(resolution_fa, resolution_fa),
            u_range=[s_left*2, s_right*2],
            v_range=[0, 0],
            stroke_color = GREEN,
            stroke_width = 2,
        )
        self.add(curve)
        # dots&paths
        '''
        # add points animations
        '''
        def addpoints(self,ini_s,t_range):#direction = 1 t>0; -1 t<0
            t = ValueTracker(0)
            path = VMobject()
            dot = Dot(
            point = curve_function(ini_s,t.get_value()),
            color = BLUE,
                )
            path.set_points_as_corners([dot.get_center(), dot.get_center()])
            dot.add_updater(lambda x: x.move_to(curve_function(ini_s,t.get_value())))

            def update_path(path):
                previous_path = path.copy()
                previous_path.add_points_as_corners([dot.get_center()])
                path.become(previous_path)
            path.add_updater(update_path)
            self.add(path, dot)
            return t.animate.increment_value(t_range)
        '''
        # add points # AnimationGroup
        '''
        curve_animations = [[addpoints(self,ini_s,t_right),addpoints(self,ini_s,t_left)] for ini_s in np.arange(s_left,s_right+0.001,0.2)]
        curve_animations = list(np.array(curve_animations).flatten())
        self.play(AnimationGroup(*curve_animations,lag_ratio=0.1))
        '''
        # add plane
        '''
        plane = Surface(
            curve_function,
            resolution=(resolution_fa, resolution_fa),
            u_range=[s_left, s_right],
            v_range=[t_left, t_right],
            stroke_color = GREEN,
            stroke_width = 2,
        )
        self.play(Create(plane))