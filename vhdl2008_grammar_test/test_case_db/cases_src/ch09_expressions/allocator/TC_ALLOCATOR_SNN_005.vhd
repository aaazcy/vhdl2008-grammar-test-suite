-- =============================================================
-- Case ID: TC_ALLOCATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Test Focus: SNN: new of an incomplete type — attempt to create allocator of incomplete type that has no full definition visible
-- Expected Result: Triggers error: cannot allocate object of incomplete type
-- Dependencies: None
-- =============================================================

entity ent_alloc_snn_005 is
  port (trig : in bit);
end entity ent_alloc_snn_005;

architecture incomplete of ent_alloc_snn_005 is
  type t_incomplete;
  type inc_ptr is access t_incomplete;
  signal s_p : inc_ptr;
begin
  process(trig)
  begin
    if trig'event and trig = '1' then
      -- ERROR: Cannot allocate incomplete type t_incomplete
      s_p <= new t_incomplete;
    end if;
  end process;
end architecture incomplete;
