package com.flutterdemo;
import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.integration_rest.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;
import com.flutterdemo.MainActivity;

@RunWith(FlutterTestRunner.class)
public  class MainActivityTest{
    @Rule
    public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
}