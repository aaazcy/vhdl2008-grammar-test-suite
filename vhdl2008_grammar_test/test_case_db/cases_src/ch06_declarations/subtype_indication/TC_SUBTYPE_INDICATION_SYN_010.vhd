-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_indication ::= [ resolution_indication ] type_mark [ constraint ]
-- Case Type: Positive
-- Test Focus: Exercises subtype_indication syntax variant 10 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subtype_indication_syn10 is
  port (
    clk   : in  bit;
    addr  : in  integer range 0 to 255;
    data  : out bit_vector(7 downto 0)
  );
end entity subtype_indication_syn10;

architecture rtl of subtype_indication_syn10 is
  type t_lut is array(0 to 255) of bit_vector(7 downto 0);
  signal s_table : t_lut := (others => (others => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 255 loop
        s_table(i) <= (others => '1');
      end loop;
      data <= s_table(addr);
    end if;
  end process;
end architecture rtl;
