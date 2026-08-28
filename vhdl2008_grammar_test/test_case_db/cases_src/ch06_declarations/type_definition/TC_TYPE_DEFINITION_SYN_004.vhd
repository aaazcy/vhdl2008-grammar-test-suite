-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_definition ::= scalar_type_definition | composite_type_definition | access_type_definition | file_type_definition | protected_type_definition
-- Case Type: Positive
-- Test Focus: Exercises type_definition via access_type_definition path with a linked-list buffer structure.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_defn_syn4 is
  port (
    clk  : in  bit;
    push : in  bit;
    data : in  integer;
    pop  : in  bit;
    val  : out integer
  );
end entity type_defn_syn4;

architecture rtl of type_defn_syn4 is
  type t_buf_node;
  type t_buf_ptr is access t_buf_node;
  type t_buf_node is record
    value : integer;
    next_node : t_buf_ptr;
  end record;
begin
  process(clk)
    variable v_head : t_buf_ptr;
  begin
    if clk'event and clk = '1' then
      if push = '1' then
        v_head := new t_buf_node'(value => data, next_node => v_head);
      end if;
      if pop = '1' and v_head /= null then
        val <= v_head.value;
        v_head := v_head.next_node;
      end if;
    end if;
  end process;
end architecture rtl;
