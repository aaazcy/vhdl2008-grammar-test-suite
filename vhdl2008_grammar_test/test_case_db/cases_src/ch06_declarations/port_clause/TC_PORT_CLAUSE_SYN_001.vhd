-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises port_clause with a rich set of typed ports including vectors, integers, and enumerated types in an SPI master interface entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_clause_spi_master is
  port (
    clk      : in    bit;
    rst_n    : in    bit;
    spi_sck  : out   bit;
    spi_mosi : out   bit;
    spi_miso : in    bit;
    spi_cs_n : out   bit_vector(1 downto 0);
    tx_data  : in    bit_vector(7 downto 0);
    rx_data  : out   bit_vector(7 downto 0);
    tx_valid : in    bit;
    rx_ready : out   bit;
    busy     : out   bit
  );
end entity port_clause_spi_master;

architecture rtl of port_clause_spi_master is
  signal s_shift : bit_vector(7 downto 0) := (others => '0');
  signal s_count : integer range 0 to 8 := 0;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_count <= 0;
      busy <= '0';
    elsif clk'event and clk = '1' then
      if tx_valid = '1' and s_count = 0 then
        s_shift <= tx_data;
        s_count <= 8;
        busy <= '1';
      elsif s_count > 0 then
        spi_mosi <= s_shift(7);
        s_shift <= s_shift(6 downto 0) & spi_miso;
        s_count <= s_count - 1;
        if s_count = 1 then
          rx_data <= s_shift(7 downto 1) & spi_miso;
          rx_ready <= '1';
          busy <= '0';
        end if;
      else
        rx_ready <= '0';
      end if;
    end if;
  end process;
  spi_sck <= clk;
  spi_cs_n <= "10" when s_count > 0 else "11";
end architecture rtl;
