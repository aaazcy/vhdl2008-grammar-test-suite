-- =============================================================
-- Case ID: TC_PORT_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Positive
-- Test Focus: Exercises port_list with multiple interface signal declarations separated by semicolons in an I2C controller entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_list_i2c_ctrl is
  port (
    clk       : in    bit;
    rst_n     : in    bit;
    scl_in    : in    bit;
    scl_out   : out   bit;
    scl_oe    : out   bit;
    sda_in    : in    bit;
    sda_out   : out   bit;
    sda_oe    : out   bit;
    tx_data   : in    bit_vector(7 downto 0);
    rx_data   : out   bit_vector(7 downto 0);
    start_cmd : in    bit;
    done_flag : out   bit
  );
end entity port_list_i2c_ctrl;

architecture rtl of port_list_i2c_ctrl is
  signal s_state : integer range 0 to 7 := 0;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_state <= 0;
      done_flag <= '0';
    elsif clk'event and clk = '1' then
      if start_cmd = '1' and s_state = 0 then
        s_state <= 1;
      elsif s_state > 0 then
        s_state <= (s_state + 1) mod 8;
        if s_state = 7 then
          done_flag <= '1';
        end if;
      else
        done_flag <= '0';
      end if;
    end if;
  end process;
  scl_out <= '1' when s_state mod 2 = 1 else '0';
  scl_oe  <= '1';
  sda_out <= tx_data(s_state mod 8);
  sda_oe  <= '1';
  rx_data <= tx_data;
end architecture rtl;
