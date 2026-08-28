-- =============================================================
-- Case ID: TC_CHOICES_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: two choices with enumeration element_simple_name and pipe in if-generate context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn7_ent is port(flag:in bit; mode:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of choices_syn7_ent is
  signal s_val:integer:=0;
begin
  process(mode, flag) is
    variable v:integer;
  begin
    v := 0;
    case mode is
      when "00"|"01" => v := 5;
      when "10"|"11" => v := 10;
    end case;
    if flag='1' then v := v*2; end if;
    y <= v;
  end process;
end architecture bh;
