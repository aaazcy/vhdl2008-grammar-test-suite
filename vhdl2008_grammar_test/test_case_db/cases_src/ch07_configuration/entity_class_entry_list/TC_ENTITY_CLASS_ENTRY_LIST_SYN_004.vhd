-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: Entity class entry list with four box-only entries — exercises the list "signal <>, variable <>, procedure <>, function <>" where every entity_class_entry carries the optional '<>' box suffix, testing the corner case where all entries in the list have the box in a SPI controller context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_spi_ctrl is
  port(
    clk      : in  bit;
    miso     : in  bit;
    mosi     : out bit;
    sclk     : out bit;
    cs_n     : out bit_vector(1 downto 0);
    tx_data  : in  bit_vector(7 downto 0);
    rx_data  : out bit_vector(7 downto 0);
    tx_start : in  bit;
    busy     : out bit
  );
end entity;

architecture rtl of ecl_spi_ctrl is
  -- Four-entry entity_class_entry_list, all with box suffix
  group spi_path is (signal, signal, procedure, function <>);

  type spi_state_t is (IDLE, TX_SHIFT, RX_SHIFT, DONE);
  signal state      : spi_state_t := IDLE;
  signal shift_reg  : bit_vector(7 downto 0) := (others => '0');
  signal bit_count  : integer range 0 to 8 := 0;
  signal sclk_int   : bit := '0';
  signal mosi_int   : bit := '0';

  function f_parity(data : bit_vector(7 downto 0)) return bit is
    variable p : bit := '0';
  begin
    for i in 0 to 7 loop
      p := p xor data(i);
    end loop;
    return p;
  end function;

  procedure p_shift_out(
    signal sreg : inout bit_vector(7 downto 0);
    signal mosi_bit : out bit
  ) is
    variable msb : bit;
  begin
    msb := sreg(7);
    sreg <= sreg(6 downto 0) & '0';
    mosi_bit <= msb;
  end procedure;

  procedure p_shift_in(
    signal sreg : inout bit_vector(7 downto 0);
    miso_bit    : in  bit
  ) is
  begin
    sreg <= sreg(6 downto 0) & miso_bit;
  end procedure;

  group sp : spi_path (shift_reg, bit_count, p_shift_out, f_parity);
begin
  process(clk)
    variable v_div : integer range 0 to 3 := 0;
  begin
    if clk'event and clk = '1' then
      case state is
        when IDLE =>
          sclk_int <= '0';
          cs_n <= "11";
          busy <= '0';
          if tx_start = '1' then
            shift_reg <= tx_data;
            bit_count <= 0;
            state <= TX_SHIFT;
            busy <= '1';
          end if;
        when TX_SHIFT =>
          cs_n <= "00";
          if v_div = 0 then
            sclk_int <= '0';
            mosi_int <= shift_reg(7);
          elsif v_div = 2 then
            sclk_int <= '1';
            shift_reg <= shift_reg(6 downto 0) & miso;
            bit_count <= bit_count + 1;
            if bit_count = 7 then
              state <= DONE;
            end if;
          end if;
          v_div := (v_div + 1) mod 4;
        when DONE =>
          sclk_int <= '0';
          cs_n <= "11";
          rx_data <= shift_reg;
          busy <= '0';
          state <= IDLE;
        when others =>
          state <= IDLE;
      end case;
    end if;
  end process;
  sclk <= sclk_int;
  mosi <= mosi_int;
end architecture rtl;
