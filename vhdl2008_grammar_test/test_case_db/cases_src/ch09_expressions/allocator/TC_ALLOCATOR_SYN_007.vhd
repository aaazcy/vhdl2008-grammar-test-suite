-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new for a linked-list node: a record containing a self-referential access type, creating and linking list nodes with new, verifying the use of allocators to build data structures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_list is
  port (
    push : in  bit;
    top  : out integer
  );
end entity ent_alloc_list;

architecture alloc_linked of ent_alloc_list is
  type t_list_node;
  type list_ptr is access t_list_node;
  type t_list_node is record
    data : integer;
    next_node : list_ptr;
  end record;
begin
  process(push)
    variable v_new : list_ptr;
    variable s_head : list_ptr;
  begin
    if push'event and push = '1' then
      v_new := new t_list_node;
      v_new.data := 42;
      v_new.next_node := s_head;
      s_head := v_new;
    end if;
    if s_head = null then
      top <= 0;
    else
      top <= s_head.data;
    end if;
  end process;
end architecture alloc_linked;
