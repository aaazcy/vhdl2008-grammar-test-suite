-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new used with a process variable: an access variable is declared inside a process and dynamically allocated with new integer, verifying the use of an allocator in a sequential context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_var is
  port (
    rst : in bit
  );
end entity ent_alloc_var;

architecture alloc_process of ent_alloc_var is
  type int_ptr is access integer;
begin
  process(rst)
    variable v_p : int_ptr;
  begin
    if rst = '1' then
      v_p := new integer;
      v_p.all := 0;
    end if;
  end process;
end architecture alloc_process;
