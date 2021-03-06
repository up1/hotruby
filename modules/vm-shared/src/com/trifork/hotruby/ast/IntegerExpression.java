package com.trifork.hotruby.ast;

import com.trifork.hotruby.interp.CompileContext;

public class IntegerExpression extends Expression {

	private String text;

	private final int radix;

	public String toString() {
		return text + "r" + radix;
	}

	/**
	 * @deprecated Use the version taking a line number!
	 */
	public IntegerExpression(String text, int radix) {
		this.text = text;
		this.radix = radix;
	}

	public IntegerExpression(int line, String text, int radix) {
		super(line);
		this.text = text;
		this.radix = radix;
	}

	public IntegerExpression(int line) {
		super(line);
		text = Integer.toString(line, radix = 10);
	}
	
	public String getText() {
		return text;
	}

	void compile(CompileContext ctx, boolean push) {
		if (push) {
			int idx = ctx.getConstantPool().add_integer(text, radix);
			ctx.emit_push_constant(idx);
		}
	}

	public Expression const_fold_negate() {
		if (text.charAt(0) == '-') {
			return new IntegerExpression(text.substring(1), radix);
		}
		return new IntegerExpression("-" + text, radix);
	}
}
