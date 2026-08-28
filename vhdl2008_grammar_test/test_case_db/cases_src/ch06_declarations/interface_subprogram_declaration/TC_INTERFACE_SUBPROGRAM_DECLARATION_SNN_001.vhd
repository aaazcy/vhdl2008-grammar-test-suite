-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Negative
-- Test Focus: 'is' followed by an invalid token — a numeric literal is not a valid interface_subprogram_default (neither subprogram_name nor <>)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'is' followed by numeric literal '42', not a valid default
-- (must be subprogram_name or <>)
entity isdecl_e1 is
  generic (
    g_bad : function fn (x : integer) return integer is 42
  );
  port (
    result : out integer
  );
end entity isdecl_e1;

architecture bh of isdecl_e1 is
begin
  result <= 0;
end architecture bh;
