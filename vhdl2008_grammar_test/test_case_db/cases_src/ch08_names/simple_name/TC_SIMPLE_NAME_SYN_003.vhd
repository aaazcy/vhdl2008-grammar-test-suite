-- =============================================================
-- Case ID: TC_SIMPLE_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: simple_name ::= identifier
-- Case Type: Positive
-- Test Focus: simple_name with extended identifiers (backslash-delimited) — extended identifiers allow special characters and keywords as names; tests that \...\ identifiers are valid simple_name instances
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_name_ext_ent is
  port(\reset\ : in bit; \data+in\ : in integer; \data+out\ : out integer);
end entity;

architecture bh of simple_name_ext_ent is
  signal \my_signal\ : integer := 0;
  constant \MAX_VAL\ : integer := 255;
  function \clamp\ (x : integer) return integer is
  begin
    if x > \MAX_VAL\ then return \MAX_VAL\;
    elsif x < 0 then return 0;
    else return x; end if;
  end function;
begin
  process(\reset\)
  begin
    if \reset\ = '1' then
      \my_signal\ <= 0;
    else
      \my_signal\ <= \clamp\(\data+in\);
    end if;
  end process;
  \data+out\ <= \my_signal\;
end architecture bh;
