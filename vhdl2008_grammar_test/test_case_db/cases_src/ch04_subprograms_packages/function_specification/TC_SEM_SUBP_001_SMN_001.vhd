-- =============================================================
-- Case ID: TC_SEM_SUBP_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_001
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Rule Description: A function return statement expression type must match the declared function return type
-- Case Type: Negative
-- Error Category: return_type_mismatch
-- Test Focus: Function f_mis is declared with return type integer, but its final return statement returns the character literal '1' (type bit character), a type mismatch between the return expression and the declared return type
-- Expected Result: Triggers semantic error: can't match character literal '1' with type integer
-- Dependencies: None
-- =============================================================
entity sem_subp1_ent is port(r:out integer); end entity;
architecture bh of sem_subp1_ent is
  function f_mis(cond:boolean) return integer is
  begin
    if cond then
      return 1;
    end if;
    return '1';
  end function;
begin
  r <= f_mis(False);
end architecture bh;
