
classdef testSineApp < matlab.uitest.TestCase
    
    methods (Test)
        function test_ChangeNowButton(testCase)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.RelativeTolerance

            app = sineApp;
            testCase.addTeardown(@delete,app);

            testCase.choose(app.AmplitudeSlider,10);
            testCase.choose(app.FrequencySlider,10);
            testCase.press(app.ChangenowButton);
            
            testCase.verifyEqual(app.t,0:0.01:10);
            expected = 10*sin(10*app.t);
            testCase.verifyThat(app.y,IsEqualTo(expected,'Within',RelativeTolerance(2*eps)));
        end
    end
    
end