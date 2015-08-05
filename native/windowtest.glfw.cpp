
// Namespaces:
namespace windowtest
{
	// Functions:
	void setWindowPosition(int X, int Y)
	{
		glfwSetWindowPos(BBGlfwGame::GlfwGame()->GetGLFWwindow(), X, Y);
		
		return;
	}
	
	void getMonitorCanvas(Array<int> output, bool minimumHeight=false)
	{
		int count;
		
		GLFWmonitor** monitors = glfwGetMonitors(&count);
		
		int minx = 0;
		int miny = 0;
		
		int width = 0;
		int height = 0;
		
		for (int i = 0; i < count; i++) // NULL
		{
			GLFWmonitor* monitor = monitors[i];
			
			int xpos, ypos;
			
			const GLFWvidmode* video = glfwGetVideoMode(monitor);
			
			width += video->width;
			
			if (!minimumHeight)
			{
				height += video->height;
			}
			else
			{
				// Not using 'min' due to some odd compatibility issues.
				if ((i == 0) || video->height < height)
				{
					height = video->height;
				}
			}
			
			glfwGetMonitorPos(monitor, &xpos, &ypos);
			
			if (xpos < minx)
			{
				minx = xpos;
			}
			
			if (ypos < miny)
			{
				miny = ypos;
			}
		}
		
		output[0] = minx;
		output[1] = miny;
		output[2] = width;
		output[3] = height;
		
		return;
	}
	
	Array<int> getMonitorCanvas(bool minimumHeight=false)
	{
		Array<int> output = Array<int>(4);
		
		getMonitorCanvas(output, minimumHeight);
		
		return output;
	}
}
