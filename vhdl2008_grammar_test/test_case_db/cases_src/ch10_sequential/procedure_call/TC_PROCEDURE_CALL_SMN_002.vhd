-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_024
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Rule Description: Actual parameter types must be compatible with formal types
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: actual parameter type incompatible — the procedure expects an integer formal but a bit_vector actual is passed, violating SEM_SEQ_024
-- Expected Result: Triggers semantic error: type mismatch in parameter association
-- Dependencies: None
-- =============================================================
entity proc_call_type_err_ent is
  port (val : in bit_vector(7 downto 0); done : out boolean);
end entity proc_call_type_err_ent;

architecture sem of proc_call_type_err_ent is
  procedure process_int(x : in integer) is
  begin
    done <= (x > 0);
  end procedure;
begin
  process(val) is
  begin
    process_int(val);  -- ERROR: bit_vector passed where integer expected
  end process;
end architecture sem;
