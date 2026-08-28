-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind (function) in subprogram_instantiation_declaration: function f is new gen_func — verifies the use of the function kind in the instantiation declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_fpkg is
  function f_id generic(type t) parameter(x:t) return t;
end package;
package body gen_fpkg is
  function f_id generic(type t) parameter(x:t) return t is begin return x; end function;
end package body;
entity sk_inst_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_inst_ent is
  function f_int_id is new work.gen_fpkg.f_id generic map(t=>integer);
begin
  y<=f_int_id(a);
end architecture bh;
