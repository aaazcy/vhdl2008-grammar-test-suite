-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_002
-- Rule Type: Syntax
-- BNF Production: element_association
-- IEEE Section: 9.3.3.1
-- BNF Text: element_association ::= [ choices => ] expression
-- Test Focus: named element association in record aggregate for a configuration register
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_element_association_syn_002 is
  port (
    clk      : in  bit;
    wr_en    : in  bit;
    wr_addr  : in  bit_vector(7 downto 0);
    wr_data  : in  bit_vector(31 downto 0);
    full_pkt : out bit_vector(47 downto 0)
  );
end entity tc_element_association_syn_002;

architecture bus_if of tc_element_association_syn_002 is
  type t_packet is record
    header : bit_vector(7 downto 0);
    addr   : bit_vector(7 downto 0);
    data   : bit_vector(31 downto 0);
  end record t_packet;

  signal pkt_reg : t_packet := (
    header => X"AA",    -- named element association
    addr   => X"00",    -- named element association
    data   => X"00000000" -- named element association
  );
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' then
        pkt_reg <= (header => X"BB", addr => wr_addr, data => wr_data);
      end if;
    end if;
  end process;
  full_pkt <= pkt_reg.header & pkt_reg.addr & pkt_reg.data;
end architecture bus_if;
