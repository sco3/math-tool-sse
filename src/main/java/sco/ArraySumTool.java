package sco;

import static java.util.Arrays.stream;

import io.quarkiverse.mcp.server.Tool;
import io.quarkiverse.mcp.server.ToolArg;

public class ArraySumTool {

	@Tool(description = "Calculates the total sum of all integers in the array.")
	Integer calculateArraySum( //
			@ToolArg(description = "Array of integers to sum.") //
			int[] numbers //
	) {
		return stream(numbers).sum();
	}
}
