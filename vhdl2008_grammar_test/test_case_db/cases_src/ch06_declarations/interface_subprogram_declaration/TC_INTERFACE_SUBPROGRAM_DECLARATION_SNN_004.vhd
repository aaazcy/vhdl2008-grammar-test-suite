-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Negative
-- Test Focus: 'is' keyword present but followed by a semicolon — the interface_subprogram_default token is completely missing after 'is'
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'is' present but interface_subprogram_default is missing
-- (nothing between 'is' and ';')
entity isdecl_e4 is
  generic (
    g_bad : function fn (x : integer) return integer is ;
  );
  port (
    result : out integer
  );
end entity isdecl_e4;

architecture bh of isdecl_e4 is
begin
  result <= 0;
end architecture bh;
