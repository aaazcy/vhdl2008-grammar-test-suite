-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new of a record type: new of a custom record type as the subtype_indication allocates a record node containing multiple fields
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_rec is
  port (
    en : in bit
  );
end entity ent_alloc_rec;

architecture alloc_record of ent_alloc_rec is
  type t_node is record
    id   : integer;
    val  : bit_vector(3 downto 0);
    next_node : natural;
  end record;
  type node_ptr is access t_node;
begin
  process(en)
    variable s_head : node_ptr;
  begin
    if en'event and en = '1' then
      s_head := new t_node;
    end if;
  end process;
end architecture alloc_record;
