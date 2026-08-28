-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Positive
-- Test Focus: Exercises alias_declaration on a record element and array slice for cleaner register access.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alias_decl_syn3 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(31 downto 0);
    byte0 : out bit_vector(7 downto 0);
    byte1 : out bit_vector(7 downto 0);
    byte2 : out bit_vector(7 downto 0);
    byte3 : out bit_vector(7 downto 0)
  );
end entity alias_decl_syn3;

architecture rtl of alias_decl_syn3 is
  type t_status_reg is record
    carry     : bit;
    zero      : bit;
    negative  : bit;
    overflow  : bit;
    reserved  : bit_vector(3 downto 0);
    interrupt : bit;
  end record;
  signal s_status : t_status_reg := ('0','1','0','0',"0000",'0');
  alias a_carry_flag : bit is s_status.carry;
  alias a_int_flag   : bit is s_status.interrupt;
  alias a_byte0 : bit_vector(7 downto 0) is data(7 downto 0);
  alias a_byte1 : bit_vector(7 downto 0) is data(15 downto 8);
  alias a_byte2 : bit_vector(7 downto 0) is data(23 downto 16);
  alias a_byte3 : bit_vector(7 downto 0) is data(31 downto 24);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      byte0 <= a_byte0;
      byte1 <= a_byte1;
      byte2 <= a_byte2;
      byte3 <= a_byte3;
    end if;
  end process;
end architecture rtl;
