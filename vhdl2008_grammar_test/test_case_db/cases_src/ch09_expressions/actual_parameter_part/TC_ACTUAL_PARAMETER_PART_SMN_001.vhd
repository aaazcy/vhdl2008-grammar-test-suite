-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_ACTUAL_PARAMETER_PART_TYPE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Rule Description: The type of each actual parameter must match the type of the corresponding formal parameter. Implicit conversion between different types is not supported.
-- Error Category: Type mismatch
-- Test Focus: SMN: actual parameter type mismatches the formal parameter type - the function expects integer but a bit_vector is passed, verifying that in actual_parameter_part the actual type must match the corresponding formal parameter declaration type
-- Expected Result: Triggers semantic error: type mismatch — expected integer, got bit_vector
-- Dependencies: None
-- =============================================================
entity ent_smn_type_mismatch is
  port (
    a_i : in  bit_vector(3 downto 0);
    y_o : out integer
  );
end entity ent_smn_type_mismatch;

architecture rtl of ent_smn_type_mismatch is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  -- ERROR: actual parameter type bit_vector does not match formal integer
  y_o <= double(a_i);
end architecture rtl;
