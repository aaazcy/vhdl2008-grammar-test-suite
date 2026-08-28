-- =============================================================
-- Case ID: TC_SEM_INTERFACE_SUBPROGRAM_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Negative (Semantic)
-- Test Focus: named default subprogram 'my_mult' has only one parameter but the interface specification declares two parameters — signature mismatch
-- Expected Result: Triggers semantic error (subprogram profile mismatch)
-- Dependencies: None
-- =============================================================

-- ERROR: default function 'my_mult' has 1 parameter, but interface
-- specification declares 2 parameters — incompatible profiles.
entity isdecl_sem1 is
  generic (
    g_mult : function multiply ( constant a, b : in integer ) return integer is my_mult
  );
  port (
    x, y : in  integer;
    prod : out integer
  );
end entity isdecl_sem1;

architecture bh of isdecl_sem1 is
  function my_mult ( constant a : in integer ) return integer is
  begin
    return a * 3;
  end function;
begin
  prod <= g_mult(x, y);
end architecture bh;
