-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Negative
-- Test Focus: Missing entity_class keyword — the box token '<>' appears without a preceding valid entity_class keyword in a group template declaration; entity_class_entry requires entity_class before the optional box
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ece_snn4_ent is
  port(
    clk   : in  bit;
    data  : in  bit_vector(3 downto 0);
    q     : out bit_vector(3 downto 0)
  );
end entity;
architecture bh of ece_snn4_ent is
  -- ERROR: '<>' without preceding entity_class keyword — entity_class_entry requires an entity_class
  group bad_template is (<>, signal);
  signal reg : bit_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      reg <= data;
    end if;
  end process;
  q <= reg;
end architecture bh;
