-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: entity_name_list with 'others' and 'all' reserved words — tests the 'others' (remaining entities) and 'all' (all entities) alternatives of entity_name_list in attribute specifications
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_others_all_ent is
  port(clk : in bit; d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
end entity;

architecture bh of enl_others_all_ent is
  attribute keep : boolean;
  signal reg : bit_vector(3 downto 0) := "0000";
  attribute keep of others : signal is true;
  attribute keep of all : label is false;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      reg <= d;
    end if;
  end process;
  q <= reg;
end architecture bh;
