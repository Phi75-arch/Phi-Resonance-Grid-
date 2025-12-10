"""
Test file for Φ-Resonance scanning.
Contains intentional dissonance patterns.
"""

def overly_complex(data, threshold, flag, verbose, callback, context, config):
    """Too many parameters - violates Φ-cognitive limits"""
    results = []
    for i in range(len(data)):
        item = data[i]
        if item > threshold:
            if flag:
                transformed = item * 2
                if verbose:
                    print(f"Transforming {item}")
                results.append(transformed)
                callback("Processed")
    return results

def nested_loop_example(items, others):
    """Manual iteration that wants to flow naturally"""
    output = []
    for i in range(len(items)):
        for j in range(len(others)):
            if items[i] > 10 and others[j] < 20:
                for k in range(5):  # Magic number
                    output.append(items[i] * others[j] * k)
    return output

# Magic numbers that could be Φ-harmonized
BUFFER_SIZE = 100  # Could be 162 (100 × Φ)
TIMEOUT = 30       # Could be 19 (30 ÷ Φ)
RETRY_COUNT = 3    # Could be 5 (Fibonacci)

# Clean, resonant function for contrast
def resonant_example(items, factor=2):
    """This should pass with high resonance"""
    return [item * factor for item in items if item > 0]
