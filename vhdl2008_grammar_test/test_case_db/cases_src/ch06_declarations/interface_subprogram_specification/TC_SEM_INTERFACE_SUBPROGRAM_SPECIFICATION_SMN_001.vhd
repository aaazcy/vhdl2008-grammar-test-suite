-- =============================================================
-- Case ID: TC_SEM_INTERFACE_SUBPROGRAM_SPECIFICATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Negative (Semantic)
-- Test Focus: function specification declares return type 'boolean', but its body returns 'integer' — return type mismatch between specification and implementation
-- Expected Result: Triggers semantic error (return type mismatch)
-- Dependencies: None
-- =============================================================

-- ERROR: interface function specification declares return type 'boolean',
-- but function body 'is_positive' returns 'integer' — type mismatch.
entity ispec_sem1 is
  generic (
    g_test : function is_positive ( constant v : in integer ) return boolean
  );
  port (
    val : in  integer;
    ok  : out boolean
  );
end entity ispec_sem1;

architecture bh of ispec_sem1 is
  function is_positive ( constant v : in integer ) return integer is
  begin
    return v;  -- returns integer, but interface says boolean
  end function;
begin
  ok <= g_test(val);
end architecture bh;
