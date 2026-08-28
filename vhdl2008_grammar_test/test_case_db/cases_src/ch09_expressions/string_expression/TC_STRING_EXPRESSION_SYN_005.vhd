-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: string signal assignment: s_msg <= "DONE" assigns a string literal to a signal of string type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_sig is
  port (
    clk  : in  bit;
    done : in  bit;
    y    : out string(1 to 4)
  );
end entity ent_str_sig;

architecture sig_str of ent_str_sig is
  signal s_msg : string(1 to 4) := "IDLE";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if done = '1' then
        s_msg <= "DONE";
      else
        s_msg <= "BUSY";
      end if;
    end if;
  end process;
  y <= s_msg;
end architecture sig_str;
