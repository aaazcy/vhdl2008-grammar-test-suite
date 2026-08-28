-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: expression as named aggregate — the 'is expression' part of attribute_specification exercised with a named record-style aggregate as the expression value, demonstrating that arbitrary VHDL expressions are valid as attribute values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_aggr_ent is
  port(clk : in bit; q : out bit_vector(3 downto 0));
  type coord_t is record x : integer; y : integer; end record;
  attribute placement : coord_t;
  attribute placement of as_aggr_ent : entity is (x => 10, y => 20);
end entity;

architecture bh of as_aggr_ent is
  signal s_cnt : integer := 0;
  signal s_q : bit_vector(3 downto 0) := "0000";
begin
  process(clk)
  begin
    if clk'event and clk='1' then
      s_cnt <= s_cnt + 1;
    end if;
  end process;
  s_q <= (others => '0') when s_cnt < 8 else (others => '1');
  q <= s_q;
end architecture bh;
