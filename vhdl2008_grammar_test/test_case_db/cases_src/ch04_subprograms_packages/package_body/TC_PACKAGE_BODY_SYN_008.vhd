-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: procedure bodies in declarative part using variable and signal parameters — exercises subprogram_body syntax within the package_body_declarative_item alternatives
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_procedures is
  port (
    clk     : in  bit;
    data_in : in  bit_vector(7 downto 0);
    latched : out bit_vector(7 downto 0);
    count   : out natural
  );
end entity pkg_body_procedures;

architecture test of pkg_body_procedures is
  signal s_latch : bit_vector(7 downto 0) := (others => '0');
  signal s_cnt   : natural := 0;

  procedure p_register(signal clk : in bit; signal din : in bit_vector; signal dout : out bit_vector) is
  begin
    if clk'event and clk = '1' then
      dout <= din;
    end if;
  end procedure;

  procedure p_increment(signal val : inout natural; max_val : in natural) is
  begin
    if val < max_val then
      val <= val + 1;
    else
      val <= 0;
    end if;
  end procedure;

begin
  p_register(clk, data_in, s_latch);

  process(clk) is
  begin
    if clk'event and clk = '1' then
      p_increment(s_cnt, 255);
    end if;
  end process;

  latched <= s_latch;
  count   <= s_cnt;
end architecture test;
