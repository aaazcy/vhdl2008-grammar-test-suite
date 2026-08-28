-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with single type_mark and no return: [integer], verification of signature form with only input parameter type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_proc_sig is
  procedure p_op generic(type t) parameter(signal x:in t);
end package;
package body gen_proc_sig is
  procedure p_op generic(type t) parameter(signal x:in t) is begin null; end procedure;
end package body;
entity sig_param_ent is port(r:out integer); end entity;
architecture bh of sig_param_ent is
  procedure p_int_op is new work.gen_proc_sig.p_op generic map(t=>integer);
begin
  r<=0;
end architecture bh;
