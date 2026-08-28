-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "new" keyword — procedure p_bad is gen_proc generic map(...), causes a missing new token syntax error
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package gen_proc_bad is
  generic(type t);
  procedure p_nop;
end package;
package body gen_proc_bad is
  procedure p_nop is begin null; end procedure;
end package body;
entity sid_bad_ent is port(r:out integer); end entity;
architecture bh of sid_bad_ent is
  -- ERROR: missing 'new' keyword in subprogram_instantiation_declaration
  procedure p_bad is gen_proc_bad.p_nop generic map(t=>integer);
begin
  r<=0;
end architecture bh;
