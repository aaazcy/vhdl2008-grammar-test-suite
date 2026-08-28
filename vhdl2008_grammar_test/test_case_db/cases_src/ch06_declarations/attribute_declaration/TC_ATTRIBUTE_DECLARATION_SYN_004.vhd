-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Positive
-- Test Focus: Exercises attribute_declaration with pre-defined attributes and user-defined enumeration attributes.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attribute_decl_syn4 is
  port (
    clk     : in  bit;
    addr    : in  bit_vector(3 downto 0);
    decoded : out bit_vector(15 downto 0)
  );
end entity attribute_decl_syn4;

architecture rtl of attribute_decl_syn4 is
  attribute encoding    : string;
  attribute addr_offset : bit_vector;

  type t_decode_table is array(0 to 15) of bit_vector(15 downto 0);
  signal s_table : t_decode_table := (others => (others => '0'));
  attribute encoding of s_table : signal is "one-hot";

  function to_integer(v : bit_vector) return integer is
    variable r : integer := 0;
  begin
    for i in v'range loop
      if v(i) = '1' then r := r + 2**i; end if;
    end loop;
    return r;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 15 loop
        if addr = "0000" then
          s_table(to_integer(addr)) <= (others => '1');
        end if;
      end loop;
      decoded <= s_table(0);
    end if;
  end process;
end architecture rtl;
