-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Negative
-- Test Focus: invalid default token — a string literal is neither a subprogram_name nor <>
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: "hello" is neither a subprogram_name nor <> —
-- invalid interface_subprogram_default.
entity isdef_e1 is
  generic (
    g_bad : function fn (x : integer) return integer is "hello"
  );
  port (
    result : out integer
  );
end entity isdef_e1;

architecture bh of isdef_e1 is
begin
  result <= 0;
end architecture bh;
