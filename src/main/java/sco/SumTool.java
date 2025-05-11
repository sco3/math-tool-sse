package sco;

import io.quarkiverse.mcp.server.Tool;
import io.quarkiverse.mcp.server.ToolArg;

public class SumTool {

	@Tool(description = "Calculates the sum of two integers.")
	Integer calculateSum( //
			@ToolArg(description = "The first integer.") //
			int first, //
			@ToolArg(description = "The second integer.") //
			int second //
	) {
		return first + second;
	}
}
