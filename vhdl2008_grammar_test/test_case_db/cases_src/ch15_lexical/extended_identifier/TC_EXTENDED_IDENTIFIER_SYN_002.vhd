-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_002
-- Rule Type: Syntax
-- BNF Production: EXTENDED_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: extended_identifier ::= \ graphic_character { graphic_character } \
-- Test Focus: Extended identifiers with various special characters (-, ., +, @, #) demonstrating the full character set
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity extended_identifier_syn_002 is
  port (
    in_a  : in  bit;
    in_b  : in  bit;
    out_x : out bit
  );
end entity extended_identifier_syn_002;

architecture rtl of extended_identifier_syn_002 is
  -- Extended identifiers with special characters
  signal \sig-with-dash\   : bit;
  signal \sig.with.dot\    : bit;
  signal \sig+plus+sign\   : bit;
begin
  \sig-with-dash\ <= in_a;
  \sig.with.dot\  <= in_b;
  \sig+plus+sign\ <= \sig-with-dash\ and \sig.with.dot\;
  out_x <= \sig+plus+sign\;
end architecture rtl;
