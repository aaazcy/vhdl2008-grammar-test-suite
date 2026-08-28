-- =============================================================
-- Case ID: TC_ALLOCATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ALLOCATOR_ACCESS_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Rule Description: An allocator creates an object of the designated type and returns an access value that designates the created object. The result must be assigned to a variable or signal of the corresponding access type.
-- Test Focus: SEM: allocator result assigned to a variable of the matching access type — the result of new integer is assigned to the int_ptr (access integer) variable, and the correct value is read after dereferencing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_sem_001 is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity ent_alloc_sem_001;

architecture access_match of ent_alloc_sem_001 is
  type int_ptr is access integer;
begin
  process(clk)
    variable v_ptr : int_ptr;
  begin
    if clk'event and clk = '1' then
      v_ptr := new integer;
      if v_ptr /= null then
        v_ptr.all := 99;
        dout <= v_ptr.all;
      else
        dout <= 0;
      end if;
    end if;
  end process;
end architecture access_match;
