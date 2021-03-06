package com.trifork.hotruby.classes;

import java.util.TimeZone;

import com.trifork.hotruby.callable.PublicMethod0;
import com.trifork.hotruby.callable.PublicMethod1;
import com.trifork.hotruby.callable.PublicMethod2;
import com.trifork.hotruby.objects.IRubyObject;
import com.trifork.hotruby.objects.RubyFixnum;
import com.trifork.hotruby.objects.RubyFloat;
import com.trifork.hotruby.objects.RubyString;
import com.trifork.hotruby.objects.RubyTime;
import com.trifork.hotruby.runtime.LoadedRubyRuntime;
import com.trifork.hotruby.runtime.MetaClass;
import com.trifork.hotruby.runtime.PublicMethodN;
import com.trifork.hotruby.runtime.RubyBlock;

public class RubyClassTime
	extends RubyBaseClassTime
{
	@Override
	public void init(MetaClass meta) {
		super.init(meta);

		meta.register_instance_method("new", new PublicMethod0() {
			@Override
			public IRubyObject call(IRubyObject receiver, RubyBlock block) {
				return new RubyTime();
			}			
		});
		
		meta.register_instance_method("inspect", new PublicMethod0() {
			@Override
			public IRubyObject call(IRubyObject receiver, RubyBlock block) {
				return new RubyString(((RubyTime) receiver).inspect());
			}			
		});
		
		meta.register_module_method("local", new PublicMethodN() {
			@Override
			public IRubyObject call(IRubyObject receiver, IRubyObject[] args, RubyBlock block) {
				return RubyTime.initialize(args, TimeZone.getDefault());
			}
		});
		
		meta.register_module_method("gm", new PublicMethodN() {
			@Override
			public IRubyObject call(IRubyObject receiver, IRubyObject[] args, RubyBlock block) {
				return RubyTime.initialize(args, TimeZone.getTimeZone("UTC"));
			}
		});
	
		meta.register_module_method("at", new PublicMethod2() {
            @Override
			public IRubyObject call(IRubyObject receiver, IRubyObject expr,
					RubyBlock b) {
            	if (expr instanceof RubyTime) {
					return new RubyTime((RubyTime) expr);
            	}
				return new RubyTime(RubyFixnum.induced_from(expr).longValue(), null);
			}

			@Override
			public IRubyObject call(IRubyObject receiver, IRubyObject expr1,
					IRubyObject expr2, RubyBlock b) {
				long secs = RubyFixnum.induced_from(expr1).longValue();
				long usecs = RubyFixnum.induced_from(expr2).longValue();
				long msecs = (secs * 1000) + (usecs / 1000);   
				return new RubyTime(msecs, null);
			}

        	@Override
        	public int getArity() {
        		return 2;
        	}
		});
		
		meta.register_instance_method("-", new PublicMethod1() {
			@Override
			public IRubyObject call(IRubyObject receiver, IRubyObject arg, RubyBlock block) {
				return ((RubyTime)receiver).subtract(arg);
			}
		});
		
		meta.register_instance_method("to_f", 
				new PublicMethod0() {
				@Override
				public IRubyObject call(IRubyObject receiver, RubyBlock block) {
					return ((RubyTime) receiver).to_f();
				}
			});


	}
	
}
