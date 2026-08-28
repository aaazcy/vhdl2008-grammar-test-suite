-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access to array — dynamic allocation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity acc_spc3_ent is port(r:out integer); end entity;
architecture bh of acc_spc3_ent is
  type t_vec_ptr is access bit_vector;
begin
  process
    variable vp : t_vec_ptr;
  begin
    vp := new bit_vector'(X"DEADBEEF");
    r <= vp'length;
    deallocate(vp);
    wait;
  end process;
end architecture bh;
