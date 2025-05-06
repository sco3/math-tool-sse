package sco;

import io.quarkiverse.mcp.server.Tool;
import io.quarkiverse.mcp.server.ToolArg;

public class MathTool {

	@Tool(description = "Get sum of two numbers.")
	Integer getSum( //@formatter:off 
			@ToolArg(description = "First number") int a, 
			@ToolArg(description = "Second number") int b 
	) {
		return a + b;
	}
}