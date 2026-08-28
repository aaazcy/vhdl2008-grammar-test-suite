-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new used in a signal assignment: the signal type is an access type, and the new expression is placed on the right side of a concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_sig is
  port (
    go   : in  bit;
    dout : out integer
  );
end entity ent_alloc_sig;

architecture alloc_signal of ent_alloc_sig is
  type int_ptr is access integer;
begin
  process(go)
    variable s_ptr : int_ptr;
  begin
    if go'event and go = '1' then
      s_ptr := new integer;
    end if;
    if s_ptr = null then
      dout <= 0;
    else
      dout <= s_ptr.all;
    end if;
  end process;
end architecture alloc_signal;
