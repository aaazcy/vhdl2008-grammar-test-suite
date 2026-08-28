-- =============================================================
-- Case ID: TC_ALLOCATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Test Focus: SNN: allocator result assigned to a variable of a non-access type — the return value of new integer is assigned to an ordinary integer variable, verifying that an allocator result must be assigned to an access type
-- Expected Result: Triggers type error: allocator result assigned to non-access type
-- Dependencies: None
-- =============================================================

entity ent_alloc_snn_002 is
  port (en : in bit);
end entity ent_alloc_snn_002;

architecture wrong_target of ent_alloc_snn_002 is
  signal s_val : integer;
begin
  process(en)
  begin
    if en'event and en = '1' then
      -- ERROR: Allocator result assigned to non-access type signal
      s_val <= new integer;
    end if;
  end process;
end architecture wrong_target;
