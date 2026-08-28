-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: procedure_specification with the 2008 generic subprogram header: procedure p generic(type t) parameter(signal x:in t), verifies the generic clause of the procedure branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_gen_ent is port(a:in integer; y:out integer); end entity;
architecture bh of ss_gen_ent is
  procedure p_copy generic(type t) parameter(signal src:in t; signal dst:out t) is
  begin dst<=src; end procedure;
  procedure p_copy_int is new p_copy generic map(t=>integer);
begin
  p_copy_int(src=>a, dst=>y);
end architecture bh;
