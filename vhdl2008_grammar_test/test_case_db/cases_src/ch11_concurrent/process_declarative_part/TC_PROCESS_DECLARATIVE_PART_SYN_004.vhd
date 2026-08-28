-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Case Type: Positive
-- Test Focus: Multiple mixed declarations——the process declarative part contains a subtype, a constant and 2 variables, verifying that the declarative part supports arbitrary ordering of multiple declaration item kinds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_multi_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity pdp_multi_ent;
architecture bh of pdp_multi_ent is
begin
  process(clk) is
    subtype t_byte is bit_vector(7 downto 0);
    constant C_MASK : t_byte := "11110000";
    variable v_data : t_byte;
    variable v_cnt  : integer := 0;
  begin
    if clk'event and clk = '1' then
      v_data := din and C_MASK;
      v_cnt  := v_cnt + 1;
      dout <= v_data;
    end if;
  end process;
end architecture bh;
