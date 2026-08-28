-- =============================================================
-- Case ID: TC_SEM_INTERFACE_SUBPROGRAM_DEFAULT_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Negative (Semantic)
-- Test Focus: default subprogram_name 'x' refers to a port signal, not a callable subprogram — name does not resolve to a function
-- Expected Result: Triggers semantic error (name does not denote a subprogram)
-- Dependencies: None
-- =============================================================

-- ERROR: default 'x' is a port signal, not a subprogram name.
-- A subprogram_name must denote a function or procedure in scope.
entity isdef_sem1 is
  generic (
    g_calc : function twice ( constant v : in integer ) return integer is x
  );
  port (
    x, y : in  integer;
    res  : out integer
  );
end entity isdef_sem1;

architecture bh of isdef_sem1 is
begin
  res <= g_calc(y);
end architecture bh;
