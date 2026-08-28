-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Negative
-- Test Focus: incomplete box notation — only '<' present without the closing '>', so <> is not formed
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: only '<' without '>' — box notation not complete
entity isdef_e4 is
  generic (
    g_bad : function fn (x : integer) return integer is <
  );
  port (
    result : out integer
  );
end entity isdef_e4;

architecture bh of isdef_e4 is
begin
  result <= 0;
end architecture bh;
