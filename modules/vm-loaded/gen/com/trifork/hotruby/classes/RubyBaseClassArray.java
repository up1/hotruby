package com.trifork.hotruby.classes;

import com.trifork.hotruby.callable.*;
import com.trifork.hotruby.classes.*;
import com.trifork.hotruby.objects.*;
import com.trifork.hotruby.runtime.*;

public abstract class RubyBaseClassArray extends RubyClass {
	static public RubyClassArray instance;

	public void init(MetaClass meta) {
		instance = (RubyClassArray) this;
		super.init(meta);

		meta.register_instance_method("[]=", new PublicMethod2() {
			public IRubyObject call(IRubyObject receiver, IRubyObject idx,
					IRubyObject val, RubyBlock b) {
				RubyArray self = (RubyArray) receiver;
				return self.at_put_x(idx, val);
			}
		});
		meta.register_instance_method("size", new PublicMethod0() {
			public IRubyObject call(IRubyObject receiver, RubyBlock b) {
				return ((RubyArray) receiver).size();
			}
		});
		meta.register_instance_method("<<", new PublicMethod1() {
			public IRubyObject call(IRubyObject receiver, IRubyObject elm,
					RubyBlock b) {
				return ((RubyArray) receiver).add(elm);
			}
		});
		meta.register_instance_method("each", new PublicMethod0() {
			public IRubyObject call(IRubyObject receiver, RubyBlock b) {
				return ((RubyArray) receiver).each(b);
			}
		});
		meta.register_instance_method("reverse", new PublicMethod0() {
			public IRubyObject call(IRubyObject receiver, RubyBlock b) {
				return ((RubyArray) receiver).reverse();
			}
		});
		meta.register_instance_method("at", new PublicMethod1() {
			public IRubyObject call(IRubyObject receiver, IRubyObject idx,
					RubyBlock b) {
				return ((RubyArray) receiver).at(idx);
			}
		});
		meta.register_instance_method("[]", new PublicMethod1() {
			public IRubyObject call(IRubyObject receiver, IRubyObject idx,
					RubyBlock b) {
				return ((RubyArray) receiver).at_x(idx);
			}
		});
	}

	public interface SelectArray {
		RubyMethod get_RubyClassArray();
	}

	public RubyMethod select(Selector sel) {
		if (sel instanceof SelectArray) {
			return ((SelectArray) sel).get_RubyClassArray();
		} else {
			return LoadedRubyRuntime.resolve_method((RubyClass) this, sel,
					SelectArray.class);
		}
	}

	public RubyClass get_class() {
		return RubyClassClass.instance;
	}

	public IRubyObject newInstance() {
		return new RubyArray();
	}
}
