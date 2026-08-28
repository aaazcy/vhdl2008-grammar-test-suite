-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part: type, constant, variable, and aliases — exercises four distinct subprogram_declarative_item alternatives in sequence within a procedure body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_four_items is
  port (
    start_addr : in  bit_vector(7 downto 0);
    offset     : in  natural;
    result     : out bit_vector(7 downto 0)
  );
end entity;

architecture test of sdp_four_items is
  procedure p_calc_addr(signal base : in bit_vector(7 downto 0); o : natural; signal res : out bit_vector(7 downto 0)) is
    -- Item 1: type_declaration
    type addr_vec_t is array(natural range <>) of bit_vector(7 downto 0);
    -- Item 2: constant_declaration
    constant C_PAGE_SIZE : natural := 256;
    -- Item 3: variable_declaration
    variable v_sum : natural := 0;
    -- Item 4: alias_declaration
    alias a_base is base;
    variable v_out : bit_vector(7 downto 0) := (others => '0');
  begin
    v_sum := 0;
    for i in a_base'range loop
      if a_base(i) = '1' then
        v_sum := v_sum + 2**(i);
      end if;
    end loop;
    v_sum := v_sum + o;
    for i in 7 downto 0 loop
      if (v_sum / (2**i)) mod 2 = 1 then
        v_out(i) := '1';
      end if;
    end loop;
    res <= v_out;
  end procedure;

  signal s_result : bit_vector(7 downto 0);
begin
  p_calc_addr(start_addr, offset, s_result);
  result <= s_result;
end architecture test;
