-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: element_subtype_definition using a simple integer range
--            subtype_indication. A digital volume control with gain
--            values stored in an array of constrained elements.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity digital_volume_control is
  port (
    clk      : in  bit;
    channel  : in  integer range 0 to 7;
    gain_db  : in  integer range -96 to 0;
    cur_gain : out integer range -96 to 0
  );
end entity digital_volume_control;

architecture rtl of digital_volume_control is
  -- element_subtype_definition: subtype_indication = integer range -96 to 0
  subtype gain_t is integer range -96 to 0;
  type gain_table is array (0 to 7) of gain_t;
  signal gains : gain_table := (others => 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      gains(channel) <= gain_db;
      cur_gain <= gains(channel);
    end if;
  end process;
end architecture rtl;
